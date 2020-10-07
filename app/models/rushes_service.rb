module RushesService
  PAGE_SIZE = 50

  def processed_rushes(params)
    rushes = Rush
    if params[:name]
      rushes = rushes.where('name like ?', "%#{params[:name]}%")
    end
    attr_exists =
      Rush::NAME_ATTR_PAIRS.select { |(_, attr)| params[:order_by] == attr.to_s }.present?
    if params[:order_by] && attr_exists
      rushes = rushes.order(params[:order_by] => params[:order])
    end
    return rushes
  end

  def paged_rushes(params, rushes)
    page = params[:page].to_i || 0
    rushes.limit(PAGE_SIZE).offset(page * PAGE_SIZE)
  end

  def page_metadata(params, rushes)
    page = params[:page].to_i || 0
    {
      page: page,
      remaining: (rushes.count - PAGE_SIZE * (page + 1))
    }
  end

  def to_csv(rushes)
    CSV.generate do |csv|
      csv << Rush::NAME_ATTR_PAIRS.map { |(a, _)| a }
      rushes.each do |rush|
        row = []
        Rush::NAME_ATTR_PAIRS.each do |_, attr|
          row << rush[attr]
        end
        csv << row
      end
    end
  end

  def order_param(params, attr)
    if params[:order_by] == attr.to_s
      params[:order] == 'asc' ? 'desc' : 'asc'
    else
      'desc'
    end
  end

  extend self
end
