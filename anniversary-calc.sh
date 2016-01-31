#!/bin/bash

DAY[0]="."
DAY[1]=" and one day."
DAY[2]=" and two days."
DAY[3]=" and three days."
DAY[4]=" and four ."
DAY[5]=" and five days."
DAY[6]=" and six days."
DAY[7]=" and one week."
DAY[8]=", one week and one day."
DAY[9]=", one week and two days."
DAY[10]=", one week and three days."
DAY[11]=", one week and four days."
DAY[12]=", one week and five days."
DAY[13]=", one week and six days."
DAY[13]=" and two weeks."
DAY[14]=", two weeks and one day."
DAY[15]=", two weeks and two days."
DAY[16]=", two weeks and three days."
DAY[17]=", two weeks and four days."
DAY[18]=", two weeks and five days."
DAY[19]=", two weeks and six days."
DAY[20]=" and three weeks."
DAY[21]=", three weeks and one day."
DAY[22]=", three weeks and two days."
DAY[23]=", three weeks and three days."
DAY[24]=", three weeks and four days."
DAY[25]=", three weeks and five days."
DAY[26]=", three weeks and six days."
DAY[26]=" and four weeks."
DAY[27]=", four weeks and one day."
DAY[28]=", four weeks and two days."
DAY[29]=", four weeks and three days."
DAY[30]=", four weeks and four days."
DAY[31]=""

MONTH[0]=""
MONTH[1]=", one μήνα"
MONTH[2]=", two μήνες"
MONTH[3]=", three μήνες"
MONTH[4]=", four μήνες"
MONTH[5]=", five μήνες"
MONTH[6]=", six μήνες"
MONTH[7]=", seven μήνες"
MONTH[8]=", eight μήνες"
MONTH[9]=", nine μήνες"
MONTH[10]=", ten μήνες"
MONTH[11]=", eleven μήνες"
MONTH[12]=""

YEAR[0]=""
YEAR[1]="one year"
YEAR[2]="two years"
YEAR[3]="three years"
YEAR[4]="four years"
YEAR[5]="five years"
YEAR[6]="six years"

ORIGINAL_YEAR=$((10#$1))
CURRENT_YEAR=$(date +"%Y")

ORIGINAL_MONTH=$((10#$2))
CURRENT_MONTH=$(date +"%-m")

WHICH_MONTH=$(( CURRENT_MONTH % 2 ))

if [ "$WHICH_MONTH" -eq 0 ]
  then
    MONTH_DAYS="31"
  else
    MONTH_DAYS="30"
fi

ORIGINAL_DAY=$((10#$3))
CURRENT_DAY=$(date +"%-d")

if [ "$CURRENT_DAY" -ge $ORIGINAL_DAY ]
  then
  DAYS=$((CURRENT_DAY-ORIGINAL_DAY))
  DAYS_TEXT="${DAY[$DAYS]}"
 else
  DAYS=$((MONTH_DAYS-ORIGINAL_DAY+CURRENT_DAY-1))
  DAYS_TEXT="${DAY[$DAYS]}"
fi

if [ "$CURRENT_MONTH" -ge $ORIGINAL_MONTH ]
  then
  if [ "$CURRENT_DAY" -ge $ORIGINAL_DAY ]
    then
    MONTHS=$((CURRENT_MONTH-ORIGINAL_MONTH))
    MONTHS_TEXT="${MONTH[$MONTHS]}"
    YEARS=$((CURRENT_YEAR-ORIGINAL_YEAR))
  else
    MONTHS=$((CURRENT_MONTH-ORIGINAL_MONTH-1))
    MONTHS_TEXT="${MONTH[$MONTHS]}"
    YEARS=$((CURRENT_YEAR-ORIGINAL_YEAR))
  fi
 else
   MONTHS=$((11-ORIGINAL_MONTH+CURRENT_MONTH))
   MONTHS_TEXT="${MONTH[$MONTHS]}"
   YEARS=$((CURRENT_YEAR-ORIGINAL_YEAR-1))
fi

YEARS_TEXT="${YEAR[$YEARS]}"
ORIGINAL_DATE="$1$2$3"

DAYS_FIRST_YEAR=$((365-$(date -d "$ORIGINAL_DATE" "+%j")))
DAYS_INBETWEEN=$((365*(CURRENT_YEAR-ORIGINAL_YEAR-1)))
DAYS_THIS_YEAR=$(date "+%-j")
TOTAL_DAYS=$(( DAYS_FIRST_YEAR+DAYS_INBETWEEN+DAYS_THIS_YEAR ))

SUBJECT="It's been $YEARS_TEXT$MONTHS_TEXT$DAYS_TEXT"

echo "$SUBJECT - $TOTAL_DAYS days in total"

exit

