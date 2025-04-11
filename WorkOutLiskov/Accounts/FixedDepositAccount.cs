using CsharpInterview.WorkOutLiskov.Abstracts;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CsharpInterview.WorkOutLiskov.Accounts
{
    public class FixedDepositAccount : BankAccount
    {
        public override void Deposit(decimal amount) => Console.WriteLine($"Fixed deposit of: {amount}");
    }
}
