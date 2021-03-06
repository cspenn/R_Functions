# =========================================================================
# Name:         clean.text
# Author:       Gaston Sanchez, modified by Christopher Penn
# Description:  This function allows to do some text cleaning with several
#               options such as coverting to lowercase, removing numbers,
#               removing punctuation symbols, removing extra white spaces
# Added: removal of URLs in strings using gsub
# License:      BSD Simplified License
#               http://www.opensource.org/license/BSD-3-Clause
#               Copyright (c) 2012, Gaston Sanchez
#               All rights reserved
# =========================================================================

clean.text <- function(x, urls=TRUE, lowercase=TRUE, numbers=TRUE, punctuation=TRUE, spaces=TRUE)
{
  # x: character string
  # URLs
  if (urls)
    x =gsub("\\s?(f|ht)(tp)(s?)(://)([^\\.]*)[\\.|/](\\S*)", "", x)
  # lower case
  if (lowercase)
    x = tolower(x)
  # remove numbers
  if (numbers)
    x = gsub("[[:digit:]]", "", x)
  # remove punctuation symbols
  if (punctuation)
    x = gsub("[[:punct:]]", " ", x)
  # remove extra white spaces
  if (spaces) {
    x = gsub("[ \t]{2,}", " ", x)
    x = gsub("^\\s+|\\s+$", "", x)
  }
  # return
  x
}

## Testing "clean.text" function
# text
some_text = "Hi!, This is just 1 stupid EXAMPLE to show clean.text :) [123-456-789]"

# default application
clean.text(some_text)

# no lowercase
clean.text(some_text, lowercase=FALSE)

# default application
clean.text(some_text, numbers=FALSE)

# default application
clean.text(some_text, punctuation=FALSE)

# default application
clean.text(some_text, spaces=FALSE)

