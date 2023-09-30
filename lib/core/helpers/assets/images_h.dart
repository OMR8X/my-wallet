const String expenseRoot = 'assets/pictures/icons/expense';
const String incomesRoot = 'assets/pictures/icons/income';
const String uiRoot = 'assets/pictures/icons/ui';

abstract class ExpensesIcons {
  static const animals = "$expenseRoot/animals.svg";
  static const bills = "$expenseRoot/bills.svg";
  static const selfCare = "$expenseRoot/self_care.svg";
  static const cars = "$expenseRoot/cars.svg";
  static const communication = "$expenseRoot/communication.svg";
  static const clothes = "$expenseRoot/clothes.svg";
  static const entertainment = "$expenseRoot/entertainment.svg";
  static const foodAndDrinks = "$expenseRoot/food_and_drinks.svg";
  static const gifts = "$expenseRoot/gifts.svg";
  static const health = "$expenseRoot/health.svg";
  static const house = "$expenseRoot/house.svg";
  static const rent = "$expenseRoot/rent.svg";
  static const shopping = "$expenseRoot/shopping.svg";
  static const sport = "$expenseRoot/sport.svg";
  static const transport = "$expenseRoot/transport.svg";
}

abstract class IncomeIcons {
  static const privateJob = "$incomesRoot/private_job.svg";
  static const salary = "$incomesRoot/salary.svg";
  // static const expense = "$incomesRoot/expense.svg";
  static const expense = "$incomesRoot/expense.svg";
  // /assets/pictures/icons/income/expense.svg
  static const reward = "$incomesRoot/reward.svg";
  static const gifts = "$incomesRoot/gifts.svg";
  static const sale = "$incomesRoot/sale.svg";
  /*
  private_job
salary
expense
reward
gifts
sale
  */
}

class UIIcon {
  static const downArrow = "$uiRoot/down_arrow.svg";
  static const upArrow = "$uiRoot/up_arrow.svg";
}
