using CsharpInterview.WorkOutLiskov.Abstracts;


namespace CsharpInterview.WorkOutLiskov.Accounts
{
    public class FixedDepositAccount : BankAccount
    {
        public override void Deposit(decimal amount) => Console.WriteLine($"Fixed deposit of: {amount}");
    }
}
