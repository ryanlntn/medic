class MenuController < BaseController

  def viewDidLoad
    super

    self.title = "Medic"

    @table = UITableView.alloc.initWithFrame(self.view.bounds)
    @table.dataSource = self
    @table.delegate = self
    @data = [
      'Authorize',
      'Characteristics',
      'ObserverQuery',
      'SampleQuery',
      'SourceQuery',
      'StatisticsCollectionQuery',
      'StatisticsQuery'
    ]

    self.view.addSubview @table
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    @reuseIdentifier ||= "CELL_IDENTIFIER"

    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier) || begin
      UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:@reuseIdentifier)
    end

    cell.textLabel.text = @data[indexPath.row]
    cell
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    tableView.deselectRowAtIndexPath(indexPath, animated: true)

    self.navigationController.pushViewController(Kernel.const_get("#{@data[indexPath.row]}Controller").new, animated: true)
  end

  def tableView(tableView, numberOfRowsInSection: section)
    @data.count
  end

end

