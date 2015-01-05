class Admin::<%= class_name %>Controller < Admin::BaseController
  inherit_resources

  <%- if options.private_methods? -%>
  private

  def collection
    return get_collection_ivar if get_collection_ivar

    @q = end_of_association_chain.search(params[:q])
    @q.sorts = 'created_at desc' if @q.sorts.blank?
    result = @q.result.page(params[:page]).per(params[:per_page])

    set_collection_ivar(result)
  end

  def permitted_params
    params.permit(<%= resource %>: <%= attributes %>)
  end
  <%- end -%>
end
