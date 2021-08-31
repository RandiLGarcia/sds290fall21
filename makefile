#!/usr/bin/env Rscript

all: www 

www: schedule.Rmd syllabus.Rmd index.Rmd _site.yml
	cp -f ~/Dropbox/Smith-Teaching/SDS-290/oiLabs-mosaic/*/*.html labs/
	cp -f ~/Dropbox/Smith-Teaching/SDS-290/oiLabs-mosaic/*/*.Rmd labs/
#	cp -f ~/Dropbox/Smith-Teaching/SDS-201/oiLabs-mosaic/*/*.css labs/
#	cp -f ../student_info/project/gradesheet.pdf handouts/
#	cp ../quizzes/R-guide.pdf handouts/
	Rscript -e "rmarkdown::render_site();"
	

upload: 
	find _site/lectures/ -type f -regex ".*\(gz\|log\|tex\)$$" | xargs rm
#	find _site/handouts/ -type f -not -name "*.pdf" | xargs rm
	rsync -avz ~/Dropbox/Smith-Research/website/ rgarcia@www.science.smith.edu:public_html/
	rsync -avz ~/Dropbox/Smith-Teaching/SDS-290/Spring2019/www/_site/ rgarcia@www.science.smith.edu:public_html/sds290-S19/


