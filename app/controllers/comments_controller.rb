class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def show
    set_comment
  end

  def new
    @comment = Comment.new
  end


  def create
    @comment = Comment.new(content: params[:content], user: User.find(11), gossip: Gossip.find(params[:gossip_id]))

    if @comment.save
      flash[:success] = "Merci #{@comment.user.first_name} ! Nous avons pu créer votre commentaire : #{@comment.content} "
      redirect_to :controller => 'gossips', :action => 'show' , id: Gossip.find(params[:gossip_id])
    else
      flash[:danger] = "Nous n'avons pas réussi à créer le commentaire pour la (ou les) raison(s) suivante(s) : #{@comment.errors.full_messages.each {|message| message}.join('')}"
      render :action => 'new'
    end
  end

  def edit
    set_comment
  end

  def update
    set_comment
    comment_params
    if @comment.update(comment_param)
      flash[:success] = "Merci #{@comment.user.first_name} ! Nous avons pu modifier votre commentaire : #{@comment.content} "
      redirect_to :controller => 'gossips', action: 'show', id: Gossip.find(params[:gossip_id])
    else
      flash[:danger] = "Nous n'avons pas réussi à modifier le commentaire pour la (ou les) raison(s) suivante(s) : #{@comment.errors.full_messages.each {|message| message}.join('')}"
      redirect_to :action => 'edit'
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
    @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:content)
    end
end
