import sys
import pdfplumber       # pip install pdfplumber
import pandas as pd     # pip install pandas
#import requests        # pip install requests
#from io import BytesIO

#url = "http://www.pref.saitama.lg.jp/a0001/news/page/2020/documents/021125-0902.pdf"
# file = '021125-0902.pdf'
file = sys.argv[1]
try:
    with pdfplumber.open(file) as pdf:
    #with pdfplumber.load(BytesIO(requests.get(url).content)) as pdf:
        for page in pdf.pages:
            table = page.extract_table()
            df = pd.DataFrame(table)
            df = df.replace( '\n', '', regex=True ) # セル内改行の削除
            df.to_csv(sys.stdout, index=False, header=False,encoding='utf-8') 
except Exception as e:
   sys.exit(e)
