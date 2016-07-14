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

# to be continued

