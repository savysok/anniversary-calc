#!/bin/bash

DAY[0]="."
DAY[1]=" και μία μέρα."
DAY[2]=" και δύο μέρες."
DAY[3]=" και τρεις μέρες."
DAY[4]=" και τέσσερις μέρες."
DAY[5]=" και πέντε μέρες."
DAY[6]=" και έξι μέρες."
DAY[7]=" και μία βδομάδα."
DAY[8]=", μία βδομάδα και μία μέρα."
DAY[9]=", μία βδομάδα και δύο μέρες."
DAY[10]=", μία βδομάδα και τρεις μέρες."
DAY[11]=", μία βδομάδα και τέσσερις μέρες."
DAY[12]=", μία βδομάδα και πέντε μέρες."
DAY[13]=", μία βδομάδα και έξι μέρες."
DAY[13]=" και δυο βδομάδες."
DAY[14]=", δυο βδομάδες και μία μέρα."
DAY[15]=", δυο βδομάδες και δύο μέρες."
DAY[16]=", δυο βδομάδες και τρεις μέρες."
DAY[17]=", δυο βδομάδες και τέσσερις μέρες."
DAY[18]=", δύο βδομάδες και πέντε μέρες."
DAY[19]=", δύο βδομάδες και έξι μέρες."
DAY[20]=" και τρεις βδομάδες."
DAY[21]=", τρεις βδομάδες και μία μέρα."
DAY[22]=", τρεις βδομάδες και δυο μέρες."
DAY[23]=", τρεις βδομάδες και τρεις μέρες."
DAY[24]=", τρεις βδομάδες και τέσσερις μέρες."
DAY[25]=", τρεις βδομάδες και πέντε μέρες."
DAY[26]=", τρεις βδομάδες και έξι μέρες."
DAY[26]=" και τέσσερις βδομάδες."
DAY[27]=", τέσσερις βδομάδες και μία μέρα."
DAY[28]=", τέσσερις βδομάδες και δύο μέρες."
DAY[29]=", τέσσερις βδομάδες και τρεις μέρες."
DAY[30]=", τέσσερις βδομάδες και τέσσερις μέρες."
DAY[31]=""

MONTH[0]=""
MONTH[1]=", έναν μήνα"
MONTH[2]=", δύο μήνες"
MONTH[3]=", τρεις μήνες"
MONTH[4]=", τέσσερις μήνες"
MONTH[5]=", πέντε μήνες"
MONTH[6]=", έξι μήνες"
MONTH[7]=", εφτά μήνες"
MONTH[8]=", οκτώ μήνες"
MONTH[9]=", εννιά μήνες"
MONTH[10]=", δέκα μήνες"
MONTH[11]=", έντεκα μήνες"
MONTH[12]=""

YEAR[0]=""
YEAR[1]="έναν χρόνο"
YEAR[2]="δύο χρόνια"
YEAR[3]="τρία χρόνια"
YEAR[4]="τέσσερα χρόνια"
YEAR[5]="πέντε χρόνια"
YEAR[6]="έξι χρόνια"

ORIGINAL_YEAR=$((10#$1))
CURRENT_YEAR=$(date +"%Y")

ORIGINAL_MONTH=$((10#$2))
CURRENT_MONTH=$(date +"%-m")
#CURRENT_MONTH=9

WHICH_MONTH=$(( CURRENT_MONTH % 2 ))

if [ "$WHICH_MONTH" -eq 0 ]
  then
    MONTH_DAYS="31"
  else
    MONTH_DAYS="30"
fi

ORIGINAL_DAY=$((10#$3))
CURRENT_DAY=$(date +"%-d")
#CURRENT_DAY=18

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

SUBJECT="Είμαστε μαζί $YEARS_TEXT$MONTHS_TEXT$DAYS_TEXT"

echo "$SUBJECT - $TOTAL_DAYS ημέρες σύνολο."

exit

