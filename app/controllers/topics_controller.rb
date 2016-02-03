class TopicsController < ApplicationController
  before_action :get_forum
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  # GET /topics
  # GET /topics.json
  def index
    @topics = @forum.topics
  end

  # GET /topics/1
  # GET /topics/1.json
  def show
    # @post = Post.new
  end

  # GET /topics/new
  def new
    @topic = Topic.new
    @topic.posts.new
  end

  # GET /topics/1/edit
  def edit
    # @topic.posts.build
  end

  # POST /topics
  # POST /topics.json
  def create
    @topic = @forum.topics.new topic_params
    @topic.last_poster_id = current_user.id
    @topic.user = current_user
    @topic.posts.first.user_id = current_user.id
    @topic.posts.first.topic = @topic

    respond_to do |format|
      if @topic.save
        # @topic.posts.create(content: posts_attributes(:content), forum_id: @forum.id, topic_id: @topic.id, user_id: current_user.id)

        format.html { redirect_to forum_topic_path(@forum, @topic), notice: 'Topic was successfully created.' }
        format.json { render :show, status: :created, location: @topic }
      else
        format.html { render :new }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /topics/1
  # PATCH/PUT /topics/1.json
  def update
    respond_to do |format|
      if @topic.update(topic_params)
        format.html { redirect_to forum_topic_path(@forum, @topic), notice: 'Topic was successfully updated.' }
        format.json { render :show, status: :ok, location: @topic }
      else
        format.html { render :edit }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy
    @topic.destroy
    respond_to do |format|
      format.html { redirect_to forum_path(@forum), notice: 'Topic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def get_forum
      @forum = Forum.find(params[:forum_id])
    end

    def set_topic
      @topic = Topic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def topic_params
      params.require(:topic).permit(:id, :title, :last_poster_id, :last_post_at, :tags, posts_attributes: [:id, :content])
    end

end
