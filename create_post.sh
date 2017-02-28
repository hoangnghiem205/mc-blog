FULL_DATE=`date +"%Y-%m-%d %H:%M:%S %z"`
DATE=`date +%Y-%m-%d`
replace="-"
NAME=`echo $1 | tr "[:upper:]" "[:lower:]" | sed -e "s/ /${replace}/g"`
TITLE="$DATE-$NAME.markdown"
touch _posts/$TITLE
cd _posts
echo "---" >> $TITLE
echo "layout: post" >> $TITLE
echo "title: \"$1\"" >> $TITLE
echo "date:   $FULL_DATE" >> $TITLE
echo "categories: jekyll update" >> $TITLE
echo "use_math: true" >> $TITLE
echo "---" >> $TITLE
echo "" >> $TITLE
echo "* write content here" >> $TITLE