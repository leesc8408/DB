import sys
import os
import django
sys.dont_write_bytecode = True
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'settings')
django.setup()

from db.models import *

# 1. Artist 생성
import datetime 
artist = Artist() 
artist.name = '아이브'
# 2021년 12월 1일
artist.debut = datetime.date(2021, 12, 1)
artist.save()

artist = Artist() 
artist.name = '아이유'
artist.debut = '2019-12-26'
artist.save()

Director.objects.create(
    name = '봉준호',
    debut = '1993-01-01',
    country = 'KOR'
)

# 기존에 5번까지는 생성한 이력이 있어서 id를 별도로 지정
Genre.objects.create(id = 5, title = '스릴러')
# id=5번은 기존 값이 삭제 안되어 있어서 값을 불러서 수정
genre = Genre.objects.get(id = 5)
genre.title = '스릴러'
genre.save()
# id번호 6번부터는 title만 지정하면 id는 자동으로
Genre.objects.create(title = '재난')

for i in Director.objects.all():
    print(i.name, i.debut, i.country)

direct = Director.objects.get(id = 1)
print(direct.name, direct.debut, direct.country)

direct = Director.objects.get(country = 'USA')
print(direct.name, direct.debut, direct.country)

direct = Director.objects.get(name = 'Joseph Kosinski')
direct.country = 'USA'
direct.save()
print(direct.name, direct.debut, direct.country)

direct = Director.objects.get(country = 'KOR')
print(direct.name, direct.debut, direct.country)

for direct in Director.objects.filter(country = 'KOR'):
    print(direct.name, direct.debut, direct.country)

direct = Director.objects.get(name = '김철수')
direct.delete()
