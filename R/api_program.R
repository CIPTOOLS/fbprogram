#' new_program_table
#'
#' creates an empty table with dummy values
#'
#' @return data.frame
#' @author Reinhard Simon
#' @export
new_program_table <- function(){
  crop_id   <- c("SP", "SP", "PT") # must be two upper case letters
  program_id <- c("OF", "VR", "DT")
  program_name <- c("orange-fleshed", "virus-resistant", "drought-resistant")
  res <- as.data.frame(cbind(crop_id, program_id, program_name),
                       stringsAsFactors = FALSE)
  crops <- fbcrops::get_crop_table()
  res$crop_id <- as.factor(res$crop_id)
  levels(res$crop_id) <- sort(unique(crops$crop_id))
  res
}

#' get_program_table
#'
#' always returns a table
#'
#' @return data.frame
#' @author Reinhard Simon
#' @export
get_program_table <- function(){
  fns <- fbglobal::fname_programs()

  if(!file.exists(fns)) {
    base_dir <-  dirname(fns)
    if(!dir.exists(base_dir)) dir.create(base_dir)
    table_programs <- new_program_table()
    save(table_programs, file = fns)
  }
  load(fns)
  table_programs
}

#' post_program_table
#'
#' store program table
#'
#' @param table_programs a data frame
#' @author Reinhard Simon
#' @export
post_program_table <- function(table_programs){
  save(table_programs, file = fbglobal::fname_programs())
}

