# Value types

## Integer
1_000_000  # => 1000000

## Floating-point Number
1.0  # => 1.0

314159.0e-5  # => 3.14159

0.31415926e1  # => 3.1415926

## Atoms
# Constants that represent something's name

:fred  # => :fred
:is_binary?  # => :is_binary?
:is_binary?a  # => %SyntaxError{description: "syntax error before: a", file: "nofile", line: 1}
:var@2  # => :var@2
:<>  # => :<>
:===  # => :===
:fun/2  # => %ArithmeticError{message: "bad argument in arithmetic expression"}
:"fun/2"  # => :"fun/2"
:"long john silver"  # => :"long john silver"

# Two atoms with the same name will always compare as being equal

## Ranges
1..20  # => 1..20

## Regular Expressions

~r{hoge}  # => ~r/hoge/
~r/hoge/  # => ~r/hoge/
~r|hgoe|i  # => ~r/hgoe/i
~r{hoge}  # => ~r/hoge/

Regex.run ~r{[aiueo]}, "caterpillar"  # => ["a"]
Regex.scan ~r{[aeiou]}, "caterpillar"  # => [["a"], ["e"], ["i"], ["a"]]
Regex.split ~r{[aeiou]}, "caterpillar"  # => ["c", "t", "rp", "ll", "r"]
Regex.replace ~r{[aeiou]}, "caterpillar", "*"  # => "c*t*rp*ll*r"

# System Types
## PIDs and Ports
### PID: reference to a local or remote process
### Port: reference to a resource to be read or written
### 'self': The PID of the current process

self  # => #PID<0.46.0>

## References
### make_ref creates a globally unique reference

make_ref  # => #Reference<0.0.3.597>
make_ref  # => #Reference<0.0.3.609>


# Collection Types
## Elixir collections can hold values of any type

## Tuples
### ordered collection of values
### Tuple cannot modified once created.

{1, 2}

{:ok, 42, "next"}

{:error, :enoent}

{ status, count, action} = {:ok, 42, "next"}
status  # => :ok
count # => 42
action # => "next"

{status, file} = File.open("Rakefile")  # => {:ok, #PID<0.88.0>}
{:ok, file} = File.open("Rakefile")  # => {:ok, #PID<0.89.0>}
{:ok, file} = File.open("no_such_file")  # => %MatchError{term: {:error, :enoent}}

## Lists
### List is like 'list' in Lisp

[1,2,3,4,5] ++ [6,7,8]  # => [1, 2, 3, 4, 5, 6, 7, 8]
[1,2,3,4] -- [2,4]  # => [1, 3]
1 in [1,2,3,4]  # => true
"wombat" in [1,2,3,4]  # => false

### Keyword lists

[name: "Taro", city: "Sapporo", likes: "Coffee"]  # => [name: "Taro", city: "Sapporo", likes: "Coffee"]
[{:name, "Taro"}, {:city, "Sapporo"}, {:likes, "Coffee"}]  # => [name: "Taro", city: "Sapporo", likes: "Coffee"]

#### the following lines are same meaning.
#### DB.save record, [ {:use_transaction, true}, {:logging, "HIGH"}]
#### DB.save record, use_transaction: true}, logging: "HIGH"

[1, hoge: 2, fuga: 3]  # => [1, {:hoge, 2}, {:fuga, 3}] list
{1, hoge: 2, fuga: 3}  # => {1, [hoge: 2, fuga: 3]} tuple

# Maps

states = %{ "AL" => "Alabama", "WI" => "Wisconsin" }  # => %{"AL" => "Alabama", "WI" => "Wisconsin"}

response_types = %{ { :error, :enoent } => :fatal, { :error, :busy } => :retry }
  # => %{{:error, :busy} => :retry, {:error, :enoent} => :fatal}

colors = %{ :red => 0xff0000, :green => 0x00ff00, :blue => 0x0000ff }
  # => %{blue: 255, green: 65280, red: 16711680}

colors = %{ red: 0xff0000, green: 0x00ff00, blue: 0x0000ff }
  # => %{blue: 255, green: 65280, red: 16711680}

%{ "one" => 1, :two => 2, {1,1,1} => 3 }  # => %{:two => 2, {1, 1, 1} => 3, "one" => 1}

name = "Hokkai Taro"
%{ String.downcase(name) => name }
  # => %{"hokkai taro" => "Hokkai Taro"}

## Accessing a Map

states = %{ "AL" => "Alabama", "WI" => "Wisconsin" }
states["AL"]
  # => "Alabama"
states["WI"]
  # => "Wisconsin"
states["TX"]
  # => nil

response_types = %{ { :error, :enoent } => :fatal, { :error, :busy } => :retry }
response_types[{:error, :busy}]
  # => :retry

colors = %{ red: 0xff0000, green: 0x00ff00, blue: 0x0000ff }
colors[:red]
  # => 16711680
colors.green
  # => 65280
colors[:hoge]
  # => nil
colors.hoge
  # => %KeyError{key: :hoge, term: %{blue: 255, green: 65280, red: 16711680}}

## Binaries

bin = <<1,2>>  # => <<1, 2>>

bin = <<3 :: size(2), 5 :: size(4), 1 :: size (2)>>  # => <<213>>
# 0b11010101 = 2^7 + 2^6 + 2^4 + 2^2 + 2^0 = 128 + 64 + 16 + 4 + 1 = 213
:io.format("~8.2b~n", :binary.bin_to_list(bin))
# => 11010101
# => :ok
byte_size bin # => 1


# Names, Source Files, Conventions, Operators, and So On

## Truth

true = :true  # => true
true = :false  # => %MatchError{term: false}
false = :false  # => false
false = nil  # => %MatchError{term: nil}
nil  # => nil
nil = :nil  # => nil

## Operators
1 === 1  # => true
1 === 1.0  # => false
1 == 1.0  # => true
1 !== 1  # => false
1 !== 2  # => true
1 > 2  # => false
2 > 1  # => true
1 >= 1  # => true
1 < 2  # => true
1 <= 1  # => true

### Boolean Operators / Relaxed Boolean Operators
a = true
b = nil
b || a  # => true
b or a  # => %ArgumentError{message: "argument error: nil"}

a = 1
!a # => false
not a # => %ArgumentError{message: "argument error"}

### Arithmetic operators
3 / 2  # => 1.5
div 3, 2  # => 1
rem 8, 3  # => 2

rem -8, 3  # => -2
rem -8, -5  # => -3

### Join operators

bin1 = <<1,2>>
bin2 = <<2,3>>
bin1 <> bin2  # => <<1, 2, 2, 3>>

a1 = [1,2,3,4]
a2 = [3,6]
a1 ++ a2   # => [1, 2, 3, 4, 3, 6]
a1 -- a2  # => [1, 2, 4]

### The in operator
a3 = [1,2,3,4]
1 in a3  # => true
5 in a3  # => false

# Variable Scope

## The with Expression

# to be continued
