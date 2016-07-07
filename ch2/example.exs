# '=' is not assignment, but 'match operator'
a = 1
a + 3

1 = a
2 = a
# ** (MatchError) no match of right hand side value: 1
# It will only change the value of a variable on the left side of an equals sign

### More complex matches

[ "xxx", "yyy", "zzz"]
[ "aaa", "bbb", [ 1,2,3] ]

list = [ 1,2,3 ]
[a, b, c] = list
a
b
c

# iex(17)> list = [ 1,2,3 ]
# list = [ 1,2,3 ]
# [1, 2, 3]
# iex(18)> [a,b,c] = list
# [a,b,c] = list
# [1, 2, 3]
# iex(19)> a
# a
# 1
# iex(20)> b
# b
# 2
# iex(21)> c
# c
# 3


list = [1,2,[3,4,5]]
[a,b,c] = list
a
b
c

# iex(23)> list = [1,2,[3,4,5]]
# list = [1,2,[3,4,5]]
# [1, 2, [3, 4, 5]]
# iex(24)> [a,b,c] = list
# [a,b,c] = list
# [1, 2, [3, 4, 5]]
# iex(25)> a
# a
# 1
# iex(26)> b
# b
# 2
# iex(27)> c
# c
# [3, 4, 5]

list = [1,2,3]
[a,2,c] = list
a
c

# iex(28)> list = [1,2,3]
# list = [1,2,3]
# [1, 2, 3]
# iex(29)> [a,2,c] = list
# [a,2,c] = list
# [1, 2, 3]
# iex(30)> a
# a
# 1
# iex(31)> c
# c
# 3

list = [1,2,3]
[a,1,b] = list

# iex(33)> [a,1,b] = list
# [a,1,b] = list
# ** (MatchError) no match of right hand side value: [1, 2, 3]

## Exercise

a = [1,2,3]
# match
a = 4
# match
4 = a
# match
[a,b] = [1,2,3]
# unmatch
# ** (MatchError) no match of right hand side value: [1, 2, 3]
a = [[1,2,3]]
# match
[a] = [[1,2,3]]
# match a = [1,2,3]
[[a]] = [[1,2,3]]
# unmatch
# ** (MatchError) no match of right hand side value: [[1, 2, 3]]

## Ignoring a value with _
[1,_,_] = [1,2,3]
[1,_,_] = [1,"cat", "dog"]

# iex(40)> [1,_,_] = [1,2,3]
# [1,_,_] = [1,2,3]
# [1, 2, 3]
# iex(41)> [1,_,_] = [1,"cat", "dog"]
# [1,_,_] = [1,"cat", "dog"]
# [1, "cat", "dog"]

## Variables Bind Once(per Match)

[a,a] = [1,1]
a
[a,a] = [1,2]
# error

# iex(42)> [a,a] = [1,1]
# [a,a] = [1,1]
# [1, 1]
# iex(43)> a
# a
# 1
# iex(44)> [a,a] = [1,2]
# [a,a] = [1,2]
# ** (MatchError) no match of right hand side value: [1, 2]

a = 1
[1,a,3] = [1,2,3]
a

# iex(44)> a = 1
# a = 1
# 1
# iex(45)> [1,a,3] = [1,2,3]
# [1,a,3] = [1,2,3]
# [1, 2, 3]
# iex(46)> a
# a
# 2

#
#  ^ : pin operator
#

a = 1
a = 2
^a = 1
# error

# iex(47)> a = 1
# a = 1
# 1
# iex(48)> a = 2
# a = 2
# 2
# iex(49)> ^a = 1
# ^a = 1
# ** (MatchError) no match of right hand side value: 1
# iex(49)> ^a = 2
# ^a = 2
# 2

a = 1
[^a,2,3] = [1,2,3]
a = 2
[^a, 2] = [1,2]
#error

# iex(50)> a = 1
# a = 1
# 1
# iex(51)> [^a,2,3] = [1,2,3]
# [^a,2,3] = [1,2,3]
# [1, 2, 3]
# iex(52)> a = 2
# a = 2
# 2
# iex(53)> [^a,2] = [1,2]
# [^a,2] = [1,2]
# ** (MatchError) no match of right hand side value: [1, 2]

## Exercise PatternMatching-2

[a,b,a] = [1,2,3]
# error
[a,b,a] = [1,1,2]
# error
[a,b,a] = [1,2,1]
#match
a
b

# iex(53)> [a,b,a] = [1,2,3]
# [a,b,a] = [1,2,3]
# ** (MatchError) no match of right hand side value: [1, 2, 3]
# iex(53)> [a,b,a] = [1,1,2]
# [a,b,a] = [1,1,2]
# ** (MatchError) no match of right hand side value: [1, 1, 2]
# iex(53)> [a,b,a] = [1,2,1]
# [a,b,a] = [1,2,1]
# [1, 2, 1]
# iex(54)> a
# a
# 1
# iex(55)> b
# b
# 2

## Exercise PatternMatching-3

# Initial state: a = 2

– [ a, b, a ] = [ 1, 2, 3 ]
# error
– [ a, b, a ] = [ 1, 1, 2 ]
# error
– a = 1
# match
– ^a = 2
# match
– ^a = 1
# error
– ^a = 2 - a
# error

# iex(56)> [a,b,a] = [1,2,3]
# [a,b,a] = [1,2,3]
# ** (MatchError) no match of right hand side value: [1, 2, 3]
# iex(56)> [a,b,a] = [1,1,2]
# [a,b,a] = [1,1,2]
# ** (MatchError) no match of right hand side value: [1, 1, 2]
# iex(56)> a = 2
# a = 2
# 2
# iex(57)> a = 1
# a = 1
# 1
# iex(58)> a = 2
# a = 2
# 2
# iex(59)> ^a = 2
# ^a = 2
# 2
# iex(60)> ^a = 1
# ^a = 1
# ** (MatchError) no match of right hand side value: 1
# iex(60)> ^a = 2 - a
# ^a = 2 - a
# ** (MatchError) no match of right hand side value: 0


## Anather way of looking at the Equals sign
