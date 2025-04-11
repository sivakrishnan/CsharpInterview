using CsharpInterview.WorkOutLiskov.Abstracts;
using CsharpInterview.WorkOutLiskov.Interface;


namespace CsharpInterview.WorkOutLiskov.Accounts
{
    public class SavingsAccount : BankAccount, IWithdrawable
    {
        public override void Deposit(decimal amount) => Console.WriteLine($"Deposited: {amount}");

        public void Withdraw(decimal amount) => Console.WriteLine($"Withdrawn: {amount}");
    }
}
