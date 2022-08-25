import sys
import os
import django
sys.dont_write_bytecode = True
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'settings')
django.setup()

from db.models import *

# 아래에 코드를 기록하세요.
# 코드 실행은 터미널에서 shell을 실행시켜서 해주세요. 
# $ python manage.py shell_plus 


# no.3-----
# directors = [
#     ("봉준호","1993-01-01","KOR"),
#     ("김한민","1999-01-01","KOR"),
#     ("최동훈","2004-01-01","KOR"),
#     ("이정재","2022-01-01","KOR"),
#     ("이경규","1992-01-01","KOR"),
#     ("한재림","2005-01-01","KOR"),
#     ("Joseph Kosinski","1999-01-01","KOR"),
#     ("김철수","2022-01-01","KOR"),
# ]

# for director in directors:
#     name_ = director[0]
#     debut_ = director[1]
#     country_ = director[2]
#     Directos.objects.create(name=name_, debut=debut_, country=country_)

# genres = ["액션","드라마","사극","범죄","스릴러","SF","무협","첩보","재난"]

# for title_ in genres:
#     genre = Genre()
#     genre.title = title_
#     genre.save()

print('# no.4-----')
director = Directos.objects.get(name = '봉준호')
print(f' id : {director.id}\n name : {director.name}\n debut : {director.debut}\n country : {director.country}')

# no.5-----
genre = Genre.objects.get(title = '드라마')
print(f'id : {genre.id}\ntitle : {genre.title}')

# no.6-----
# director_ = Directos.objects.get(name='봉준호')
# genre_ = Genre.objects.get(title='드라마')

# movie = Movie()
# movie.director = director_
# movie.genre = genre_
# movie.title = '기생충'
# movie.opening_date = '2019-05-30'
# movie.running_time = '132'
# movie.screening = False
# movie.save()

#no.7-----
# movies = [
#     ("봉준호", "드라마", "괴물", "2006-07-27", 119, False),
#     ("봉준호", "SF", "설국열차", "2013-10-30", 125, False),
#     ("김한민", "사극", "한산", "2022-07-27", 129, True),
#     ("최동훈", "SF", "외계+인", "2022-07-20", 142, False),
#     ("이정재", "첩보", "헌트", "2022-08-10", 125, True),
#     ("이경규", "액션", "복수혈전", "1992-10-10", 88, False),
#     ("한재림", "재난", "비상선언", "2022-08-03", 140, True),
#     ("Joseph Kosinski", "액션", "탑건 : 매버릭", "2022-06-22", 130, True),
# ]

# for i in movies:
#     movie = Movie()
#     movie.director = Directos.objects.get(name=i[0])
#     movie.genre = Genre.objects.get(title=i[1])
#     movie.title = i[2]
#     movie.opening_date = i[3]
#     movie.running_time = i[4]
#     movie.screening = i[5]
#     movie.save()

# no.8-----
for i in Movie.objects.all():
    print(i.director, i.genre, i.title, i.opening_date, i.running_time, i.screening)

# no.9-----
for i in Movie.objects.all():
    print(
        i.director.name, 
        i.genre, 
        i.title, 
        i.opening_date, 
        i.running_time, 
        i.screening
    )

# no.10-----
for i in Movie.objects.all():
    print(
        i.director.name, 
        i.genre.title, 
        i.title, 
        i.opening_date, 
        i.running_time, 
        i.screening
    )

# no.11-----
for i in Movie.objects.order_by('-opening_date'):
    print(
        i.director.name, 
        i.genre.title, 
        i.title, 
        i.opening_date, 
        i.running_time, 
        i.screening
    )

# no.12-----
first_movie = Movie.objects.order_by('opening_date')[0]
print(
    first_movie.director.name, 
    first_movie.genre.title, 
    first_movie.title, 
    first_movie.opening_date, 
    first_movie.running_time, 
    first_movie.screening
)

# no.13-----
for screening_movie in Movie.objects.filter(screening = True).order_by('opening_date'):
    print(
        screening_movie.director.name, 
        screening_movie.genre.title, 
        screening_movie.title, 
        screening_movie.opening_date, 
        screening_movie.running_time, 
        screening_movie.screening
    )

# no.14-----
director_ = Directos.objects.get(name='봉준호')
for screening_movie in Movie.objects.filter(director=director_).order_by('opening_date'):
    print(
        screening_movie.director.name, 
        screening_movie.genre.title, 
        screening_movie.title, 
        screening_movie.opening_date, 
        screening_movie.running_time, 
        screening_movie.screening
    )

# no.15-----
director_ = Directos.objects.get(name='봉준호')
screening_movie = Movie.objects.filter(director=director_).order_by('opening_date')[1]
print(
    screening_movie.director.name, 
    screening_movie.genre.title, 
    screening_movie.title, 
    screening_movie.opening_date, 
    screening_movie.running_time, 
    screening_movie.screening
)

# no.16-----
for movie_time in Movie.objects.filter(running_time__gt=119).order_by('running_time'):
    print(
        movie_time.director.name, 
        movie_time.genre.title, 
        movie_time.title, 
        movie_time.opening_date, 
        movie_time.running_time, 
        movie_time.screening
    )

# no.17-----
for movie_time in Movie.objects.filter(running_time__gte=119).order_by('running_time'):
    print(
        movie_time.director.name, 
        movie_time.genre.title, 
        movie_time.title, 
        movie_time.opening_date, 
        movie_time.running_time, 
        movie_time.screening
    )

# no.18-----
for new_movie in Movie.objects.filter(opening_date__gte='2022-01-01').order_by('opening_date'):
    print(
        new_movie.director.name, 
        new_movie.genre.title, 
        new_movie.title, 
        new_movie.opening_date, 
        new_movie.running_time, 
        new_movie.screening
    )

# no.19-----
director_ = Directos.objects.get(name='봉준호')
genre_ = Genre.objects.get(title='드라마')
for bong_movie in Movie.objects.filter(director=director_, genre=genre_).order_by('opening_date'):
    print(
        bong_movie.director.name, 
        bong_movie.genre.title, 
        bong_movie.title, 
        bong_movie.opening_date, 
        bong_movie.running_time, 
        bong_movie.screening
    )

# no.20-----
director_ = Directos.objects.get(name='봉준호')
for no_bong_movie in Movie.objects.exclude(director=director_).order_by('opening_date'):
    print(
        no_bong_movie.director.name, 
        no_bong_movie.genre.title, 
        no_bong_movie.title, 
        no_bong_movie.opening_date, 
        no_bong_movie.running_time, 
        no_bong_movie.screening
    )