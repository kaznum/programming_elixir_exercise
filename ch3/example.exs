### You already have (some) Immutable data
### Immutable data is Known Data

### Performance implications of immutablity

## Copying data

list1 = [3,2,1]
list2 = [ 4 | list1 ]

# iex(60)> list1 = [3,2,1]
# list1 = [3,2,1]
# [3, 2, 1]
# iex(61)> list2 = [4|list1]
# list2 = [4|list1]
# [4, 3, 2, 1]

## Garbase Collection

### Coding with Immutable Data
name = "elixir"
cap_name = String.capitalize name
name

# iex(62)> name = "elixir"
# name = "elixir"
# "elixir"
# iex(63)> cap_name = String.capitalize name
# cap_name = String.capitalize name
# "Elixir"
# iex(64)> name
# name
# "elixir"
