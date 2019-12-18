# curl -O https://raw.githubusercontent.com/pilosa/getting-started/master/stargazer.csv
# curl -O https://raw.githubusercontent.com/pilosa/getting-started/master/language.csv
pilosa import -i repository -f stargazer /data/raw/repository/stargazer.csv
pilosa import -i repository -f language /data/raw/repository/language.csv
