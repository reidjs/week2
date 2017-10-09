require 'byebug'
class Employee
  attr_accessor :name, :title, :salary, :boss
  def initialize(name = "bob", title = "grunt",
     salary = 100, boss = nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
    @boss.employees << self if !@boss.nil?
  end

  def bonus(multiplier)
    @salary * multiplier
  end

  def employees
    []
  end

  def total_employees(employees)
    return employees if employees.empty?
    result = []
    employees.each do |employee|
      result += [employee] + employee.total_employees(employee.employees)
    end
    result
  end

  def get_employees_salaries
    employees_list = total_employees(@employees)
    salaries_list = employees_list.map {|emp| emp.salary }
  end

end

class Manager < Employee
  attr_accessor :employees
  def initialize(*args)
    @employees = []
    super
  end

  def bonus(multiplier)
    get_employees_salaries.inject(:+) * multiplier
  end
end


ned = Manager.new("ned", "founder", 1000000, nil)
darren = Manager.new("darren", "manager", 78000, ned)
shawna = Employee.new("shawna", "employee", 12000, darren)
david = Employee.new("david", "employee", 10000, darren)
# p ned.total_employees(ned.employees)
# ned.get_employees_salaries
p ned.bonus(5)

p darren.bonus(4)
p david.bonus(3)
