// See https://aka.ms/new-console-template for more information
using CsharpInterview;
using CsharpInterview.Common;
using CsharpInterview.LogicalProgam;
using CsharpInterview.ToListVsToArray;
using CsharpInterview.WorkOutAbstractClass;
using CsharpInterview.WorkOutBasicSingleton;
using CsharpInterview.WorkOutClassHierarchy;
using CsharpInterview.WorkOutExtensionMethod;
using CsharpInterview.WorkOutFunc;
using CsharpInterview.WorkOutMethodHiding;
using CsharpInterview.WorkOutOutKeyword;
using CsharpInterview.WorkOutOverriding;
using CsharpInterview.WorkOutRefKeyword;
using CsharpInterview.WorkOutStaticConstructor;
using CsharpInterview.WorkOutThread;

Console.WriteLine("Hello, World!");


SecondChildAbstractClass objChildAbstractClass = new SecondChildAbstractClass();
Console.WriteLine("value--" + AbstractClass.first.ToString());

Console.WriteLine("----------------------------------------");


FirstChildAbstractClass objFirstChildAbstractClass = new FirstChildAbstractClass();


Console.WriteLine("----------------Method Overriding------------------------");

MethodOverridingBaseClass b = new MethodOverridingBaseClass();
b.print();

MethodOverridingDerivedClass d = new MethodOverridingDerivedClass();
d.print();
((MethodOverridingBaseClass)d).print();

MethodOverridingBaseClass bOverride = new MethodOverridingDerivedClass();
bOverride.print();


MethodOverridingBaseClass bOverride1 = new MethodOverridingDerivedClass();
((MethodOverridingDerivedClass)bOverride1).print();



Console.WriteLine("----------------Method Hiding------------------------");

MethodHidingBaseClass bHide = new MethodHidingBaseClass();
bHide.print();

MethodHidingDerivedClass dHide = new MethodHidingDerivedClass();
dHide.print();
((MethodHidingBaseClass)dHide).print();

MethodHidingBaseClass bdHideFinal = new MethodHidingDerivedClass();
bdHideFinal.print();

Console.WriteLine("----------------Ref Keyword------------------------");

int a = 10;
int at = 20;
Multiply(ref at);
Console.WriteLine(at);

static void Multiply(ref int number)
{
    number *= 2;
}

Console.WriteLine($"Before call a value is ={a}");
RefKeyword objRef = new RefKeyword();
objRef.TestRefKeyword(ref a);
Console.WriteLine($"After call a value is={a}");

Console.WriteLine("----------------Out Keyword------------------------");

int outValue = 10;


Console.WriteLine($"Before call a value is ={outValue}");
OutKeyword objOut = new OutKeyword();
objOut.TestOutKeyword(out outValue);
Console.WriteLine($"After call a value is={outValue}");


Console.WriteLine("----------------Array with Multiple Type------------------------");

object[] arrObject = new object[3];

arrObject[0] = 1;
arrObject[1] = "string";
arrObject[2] = b;

foreach (var type in arrObject)
{
    Console.WriteLine($"value is={type}");
}

Console.WriteLine("----------------Extension Method------------------------");

string strExtension = "first second third";

Console.WriteLine($"Extension Method Output- {strExtension.FirstWord()}");

Console.WriteLine("----------------Each word in string reverse------------------------");

string inputString = "one two three four five";
string result = string.Join(" ", inputString.Split(' ').Reverse().Select(x => new string(x.Reverse().ToArray())));

Console.WriteLine($"result is={result}");

Console.WriteLine("----------------Class Hierarchy------------------------");

OuterClass outerClass = new OuterClass();
outerClass.outclassfunction();

OuterClass.InnerClass inner = new OuterClass.InnerClass();
inner.innerclassfunction();

Console.WriteLine("----------------Singleton Example-----------------------");

BasicSingleton obj1 = BasicSingleton.GetInstance;
obj1.PrintDetails("basic singleton 1.");

BasicSingleton obj2 = BasicSingleton.GetInstance;
obj2.PrintDetails("basic singleton 2.");


Console.WriteLine("----------------Logical Progam-----------------------");

string logicalInput = "(dafsd{adfsd[abc]}})";
LogicalPrograms objLogical = new LogicalPrograms(logicalInput);
objLogical.CheckOpenCloseBracesProper();

string logicalInput1 = "abbcccddddeeeee";
LogicalPrograms objLogical1 = new LogicalPrograms(logicalInput1);
objLogical1.NumberOfOccurenceOfEachChar();

LogicalPrograms objLogical2 = new LogicalPrograms();
objLogical2.SumOfArrayElements();

LogicalPrograms objLogical3 = new LogicalPrograms();
objLogical3.FirstAndLastInSqureBraces();




Console.WriteLine("---------------veni test-----------------------");
Parent P = new Parent();

P.Print();

Child P1 = new Child();

P1.Print();

Console.WriteLine("-------------ToArray vs ToList-----------------");
ToListVsToArrays obj = new ToListVsToArrays();
obj.SomeCheck();

int[] arrayNumbers = { 1, 2, 3, 4, 5 };
var query = from num in arrayNumbers
            where num % 2 == 0
            select num;
arrayNumbers = arrayNumbers.Append(6).ToArray();
Console.WriteLine("After filter and append one value count={0}", query.Count());

Console.WriteLine("-------------Deferred Execution-----------------");

List<int> numbersDeferred = new List<int> { 1, 2, 3, 4, 5 };
var query1 = numbersDeferred.Where(n => n > 2);
numbersDeferred.Add(45);
foreach (var number in query1)
{
    Console.WriteLine(number);
}

Console.WriteLine("-------------Immediate Execution-----------------");

List<int> numbersImmediate = new List<int> { 1, 2, 3, 4, 5 };
var query1Immediate = numbersImmediate.Where(n => n > 2).ToList();
numbersImmediate.Add(45);
foreach (var number in query1Immediate)
{
    Console.WriteLine(number);
}


Console.WriteLine("-------------Func vs Action vs Predicate Workout-----------------");

FuncCheck objFunc = new FuncCheck();
objFunc.FuncWithTwoParameter();


Console.WriteLine("----------------StaticConstructor--------------");
StaticConstructor sc1 = new StaticConstructor();
StaticConstructor sc2 = new StaticConstructor();

Console.WriteLine("----------------var vs dynamic--------------");

var i = 0;
//i = "test"; //compile time error 
dynamic j = 1;
j = "test";
object k = 2;
k = "test";


Console.WriteLine("----------------Single vs First--------------");

string[] data = { "test", "test1", "test1" };

//string str0 = data.Where(x => x == "test2").Single(); //  exception Sequence contains no elements

//string str = data.Where(x => x == "test1").Single(); // exception like sequence contains more than one occurence

//string str = data.Where(x => x == "test2").First(); // exception Sequence contains no elements

string str = data.Where(x => x == "test1").First();

string str1 = data.Where(x => x == "test2").SingleOrDefault();
//string str2 = data.Where(x => x == "test1").SingleOrDefault(); // exception like sequence contains more than one occurence
string str3 = data.Where(x => x == "test2").FirstOrDefault();
string str4 = data.Where(x => x == "test1").FirstOrDefault();


//Console.WriteLine("----------------Thread with ThreadStart Delegate--------------");

//Thread t1 = new Thread(new ThreadStart(WorkOutThreads.PrintNumbers));
//t1.Start();


//Console.WriteLine("----------------Thread with Delegate keyword--------------");

//Thread t2 = new Thread(delegate () { WorkOutThreads.PrintNumbers(); });
//t2.Start();

//Console.WriteLine("----------------Thread with Lambda expression-------------");

//Thread t3 = new Thread(() => WorkOutThreads.PrintNumbers());
//t3.Start();

//Console.WriteLine("----------------Thread -------------");

//Thread t4 = new Thread(WorkOutThreads.PrintNumbers);
//t4.Start();


Console.WriteLine("----------------Thread with parameter- this is loose the type safety------------");

//object target = 10;
//ParameterizedThreadStart pt = new ParameterizedThreadStart(WorkOutThreads.PrintNumbers);
//Thread t5 = new Thread(pt);
//t5.Start(target);


Console.WriteLine("----------------Thread with parameter- to make sure the type safety use helper class------------");

int target = 10;
WorkOutThreads wt = new WorkOutThreads(target, null);

Thread t6 = new Thread(new ThreadStart(wt.PrintNumbers));
t6.Start();


Console.WriteLine("----------------Thread with callback function------------");

static void PrintSum(int sum)
{
    Console.WriteLine("Sum of Numbers=" + sum);
}


SumOfNumbersCallback callback = new SumOfNumbersCallback(PrintSum);

int target1 = 10;
WorkOutThreads wt1 = new WorkOutThreads(target1, callback);

Thread t7 = new Thread(new ThreadStart(wt1.PrintSumOfNumbers));
t7.Start();


Console.WriteLine("----------------Second Highest Salary--------------");

Employee emp = new Employee();
emp.employees=new List<Employee>(){
    new Employee { Id = 1, Name = "Alice", Salary = 5000 },
            new Employee { Id = 2, Name = "Bob", Salary = 7000 },
            new Employee { Id = 3, Name = "Charlie", Salary = 7000 },
            new Employee { Id = 4, Name = "David", Salary = 6000 },
        };
var secondHighestSalary = emp.employees
    .Select(e => e.Salary)
    .Distinct()
    .OrderByDescending(s => s)
    .Skip(1)
    .FirstOrDefault();

Console.WriteLine("Second Highest Salary: " + secondHighestSalary);
