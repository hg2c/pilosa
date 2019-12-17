echo "Which repositories did user 14 star:"

cat <<-END
What are the top 5 languages in the sample data:
{
    "results":[
        [
            {"id":5,"count":119},
            {"id":1,"count":50},
            {"id":4,"count":48},
            {"id":9,"count":31},
            {"id":13,"count":25}
        ]
    ]
}
END
)
 curl -s ${endpoint}/index/repository/query \
      -X POST \
      -d 'TopN(language, n=5)'
