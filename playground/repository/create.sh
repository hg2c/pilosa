# Before we can import data or run queries, we need to create our indexes
# and the fields within them. Let’s create the repository index first:
# The index name must be 64 characters or fewer, start with a letter, and
# consist only of lowercase alphanumeric characters or _-. The same goes
# for field names.
curl localhost:10101/index/repository -X POST

# Let’s create the stargazer field which has user IDs of stargazers as its rows:
# Since our data contains time stamps which represent the time users starred
# repos, we set the field type to time. Time quantum is the resolution of the
# time we want to use, and we set it to YMD (year, month, day) for stargazer.
curl localhost:10101/index/repository/field/stargazer \
     -X POST \
     -d '{"options": {"type": "time", "timeQuantum": "YMD"}}'

# Next up is the language field, which will contain IDs for programming languages:
# The language is a set field, but since the default field type is set, we didn’t
# specify it in field options.
curl localhost:10101/index/repository/field/language \
     -X POST
