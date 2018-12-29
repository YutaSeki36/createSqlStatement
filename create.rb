# encoding: utf-8

# 苗字と名前のリストから名前を生成
def random_name
  random = Random.new()
  lastName = ['関','仲澤','白田','高橋','山下','佐藤','白井','工藤']
  firstName = ['雄太','義弘','光','純平','鉄平','健','裕二','武史','武蔵','智史','宗介','隆盛','龍馬']

  lastName[random.rand(0..lastName.length-1)] + firstName[random.rand(0..firstName.length-1)]
end

# 0~100の乱数を生成
def random_age
  Random.new.rand(0..100)
end

def random_job
  random = Random.new()
  job = ['システムエンジニア','デザイナー','事務職','看護師','警察官','美容師','無職']

  job[random.rand(0..job.length-1)]
end

# 出力するファイル名
OUTPUT_FILE = 'TestData.sql'

# 登録するデータ件数
RECORD_COUNT = 0..10000

# 実行するsql文
sqlCommands = ''

# DB名を指定
sqlCommands += 'USE project1;\n'

# 登録するデータの数だけINSERT文を生成
RECORD_COUNT.each{ |num|
  name = random_name
  age = random_age
  job = random_job

  sqlCommands += "INSERT INTO users " \
                   "(name, age, job) " \
                   "VALUES ('#{name}', '#{age}', '#{job}');\n"
}


# 生成したSQLコマンドをファイルに書き出す
File.open(OUTPUT_FILE, "w") do |text|
  text.puts(sqlCommands)
end
