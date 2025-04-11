using CsharpInterview.WorkOutLiskov.Interface;


namespace CsharpInterview.WorkOutLiskov.Clients
{
    public class TellerMachine
    {
        public void WithdrawFromAccount(IWithdrawable account, decimal amount)
        {
            account.Withdraw(amount); // Only for accounts that support withdrawal
        }
    }
}
