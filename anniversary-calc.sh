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
MONTH[1]=", one month"
MONTH[2]=", two months"
MONTH[3]=", three months"
MONTH[4]=", four months"
MONTH[5]=", five months"
MONTH[6]=", six months"
MONTH[7]=", seven months"
MONTH[8]=", eight months"
MONTH[9]=", nine months"
MONTH[10]=", ten months"
MONTH[11]=", eleven months"
MONTH[12]=""

YEAR[0]=""
YEAR[1]="one year"
YEAR[2]="two years"
YEAR[3]="three years"
YEAR[4]="four years"
YEAR[5]="five years"
YEAR[6]="six years"
YEAR[7]="seven years"
YEAR[8]="eight years"
YEAR[9]="nine years"
YEAR[10]="ten years"
YEAR[11]="eleven years"
YEAR[12]="twelve years"
YEAR[13]="thirteen years"
YEAR[14]="fourteen years"
YEAR[15]="fifteen years"
YEAR[16]="sixteen years"
YEAR[17]="seventeen years"
YEAR[18]="eighteen years"
YEAR[19]="nineteen years"
YEAR[20]="twenty years"
YEAR[21]="twenty one years"
YEAR[22]="twenty two years"
YEAR[23]="twenty three years"
YEAR[24]="twenty four years"
YEAR[25]="twenty five years"
YEAR[26]="twenty six years"
YEAR[27]="twenty seven years"
YEAR[28]="twenty eight years"
YEAR[29]="twenty nine years"
YEAR[30]="thirty years"
YEAR[31]="thirty one years"
YEAR[32]="thirty two years"
YEAR[33]="thirty three years"
YEAR[34]="thirty four years"
YEAR[35]="thirty five years"
YEAR[36]="thirty six years"
YEAR[37]="thirty seven years"
YEAR[38]="thirty eight years"
YEAR[39]="thirty nine years"
YEAR[40]="forty years"
YEAR[41]="forty one years"
YEAR[42]="forty two years"
YEAR[43]="forty three years"
YEAR[44]="forty four years"
YEAR[45]="forty five years"
YEAR[46]="forty six years"
YEAR[47]="forty seven years"
YEAR[48]="forty eight years"
YEAR[49]="forty nine years"
YEAR[50]="fifty years"
YEAR[51]="fifty one years"
YEAR[52]="fifty two years"
YEAR[53]="fifty three years"
YEAR[54]="fifty four years"
YEAR[55]="fifty five years"
YEAR[56]="fifty six years"
YEAR[57]="fifty seven years"
YEAR[58]="fifty eight years"
YEAR[59]="fifty nine years"
YEAR[60]="sixty years"
YEAR[61]="sixty one years"
YEAR[62]="sixty two years"
YEAR[63]="sixty three years"
YEAR[64]="sixty four years"
YEAR[65]="sixty five years"
YEAR[66]="sixty six years"
YEAR[67]="sixty seven years"
YEAR[68]="sixty eight years"
YEAR[69]="sixty nine years"
YEAR[70]="seventy years"
YEAR[71]="seventy one years"
YEAR[72]="seventy two years"
YEAR[73]="seventy three years"
YEAR[74]="seventy four years"
YEAR[75]="seventy five years"
YEAR[76]="seventy six years"
YEAR[77]="seventy seven years"
YEAR[78]="seventy eight years"
YEAR[79]="seventy nine years"
YEAR[80]="eighty years"
YEAR[81]="eighty one years"
YEAR[82]="eighty two years"
YEAR[83]="eighty three years"
YEAR[84]="eighty four years"
YEAR[85]="eighty five years"
YEAR[86]="eighty six years"
YEAR[87]="eighty seven years"
YEAR[88]="eighty eight years"
YEAR[89]="eighty nine years"
YEAR[90]="ninety years"
YEAR[91]="ninety one years"
YEAR[92]="ninety two years"
YEAR[93]="ninety three years"
YEAR[94]="ninety four years"
YEAR[95]="ninety five years"
YEAR[96]="ninety six years"
YEAR[97]="ninety seven years"
YEAR[98]="ninety eight years"
YEAR[99]="ninety nine years"
YEAR[100]="one hundred years"

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
