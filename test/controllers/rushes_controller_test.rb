require 'test_helper'
require 'csv'

class RushesControllerTest < ActionDispatch::IntegrationTest
  setup do
    RushImporter.import(Rails.root.join('db', 'rushing.json'))
  end

  test "should get index" do
    get rushes_url
    assert_response :success
  end

  test "processed_rushes orders data" do
    rushes = RushesService.processed_rushes(order: 'desc', order_by: 'name')
    rush = rushes.first
    assert(rush.name == 'Zach Zenner')
  end

  test "processed_rushes filters by name" do
    rushes = RushesService.processed_rushes(name: 'sam')
    assert(rushes.count == 3)
  end

  test "paged_rushes pages results" do
    rushes = RushesService.paged_rushes({ page: 0 }, Rush.all)
    assert(rushes.count == RushesService::PAGE_SIZE)
  end

  test "paged_rushes gets correct page" do
    rushes = RushesService.paged_rushes({ page: 2 }, Rush.order(name: 'desc'))
    rush = rushes.first
    assert(rush.name == 'Matt Cassel')
  end

  test "to_csv returns correct csv" do
    csv = CSV.new(RushesService.to_csv(Rush.order(name: 'desc')))
    rows = csv.read
    header = rows.first
    header.each_with_index do |head, i|
      assert(head == Rush::NAME_ATTR_PAIRS[i][0])
    end
    assert(rows.size == Rush.count + 1)
    assert(rows[1][0] == 'Zach Zenner')
  end
end
