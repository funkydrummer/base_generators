class NotesController < ApplicationController

  def index
    load_<%= resource %>s
  end

  def show
    load_<%= resource %>
  end

  def new
    build_<%= resource %>
  end

  def create
    build_<%= resource %>
    save_<%= resource %> or render 'new'
  end

  def edit
    load_<%= resource %>
    build_<%= resource %>
  end

  def update
    load_<%= resource %>
    build_<%= resource %>
    save_<%= resource %> or render 'edit'
  end

  def destroy
    load_<%= resource %>
    @<%= resource %>.destroy
    redirect_to <%= resource %>s_path
  end

  private

  def load_<%= resources %>
    @<%= resources %> ||= <%= resource %>_scope.to_a
  end

  def load_<%= resource %>
    @<%= resource %> ||= <%= resource %>_scope.find(params[:id])
  end

  def build_<%= resource %>
    @<%= resource %> ||= <%= resource %>_scope.build
    @<%= resource %>.attributes = <%= resource %>_params
  end

  def save_<%= resource %>
    if @<%= resource %>.save
      redirect_to @<%= resource %>
    end
  end

  def <%= resource %>_params
    <%= resource %>_params = params[:<%= resource %>]
    <%= resource %>_params ? <%= resource %>_params.permit(:title, :text, :published) : {}
  end

  def <%= resource %>_scope
    <%= class_name %>.scoped
  end
end
