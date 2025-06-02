# This project will create a csv file that contains the email, first name,
# and last name of all individuals that submitted a consent form
# and completed the PDSA Module 1
########################################################

#######################################################
# reading in csv file containing consent form submissions
# reading in csv file containing PDSA module 1 submissions
#########################################################
setwd("C:/Users/brook/OneDrive/Documents/SP24 Math Anxiety")

consent <- read.csv('Consent_Form.csv')
print(consent)
print(nrow(consent))


form1 <- read.csv('Module_1.csv')
print(form1)
print(nrow(form1))

########################################################
# combines those that completed
# consent form and module 1 PDSA
#####################################################
for (n in 1:nrow(consent))
{
  for (m in 1:nrow(form1))
  {
    if (consent[n,2] == form1[m,2])
    {
      # Reading the existing data
      #data_existing <- read.csv("Completed.csv")
      
      # Creating new data
      data_new <- data.frame(
        "Email" = consent[n,2],
        "Last.Name" = form1[m,3],
        "First.Name" = form1[m,4])
      

      write.table(data_new, "Completed.csv",
                  append = TRUE,
                  sep = ",",
                  col.names = FALSE,
                  row.names = FALSE,
                  quote = FALSE)
    }
  }
}




