-- MySQL Workbench Synchronization
-- Generated: 2022-10-02 05:52
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: amarpreet.kaur

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

ALTER TABLE `registrardb`.`enroll` 
;
ALTER TABLE `registrardb`.`enroll` ALTER INDEX `FK_Student2_idx` INVISIBLE;

ALTER TABLE `registrardb`.`enroll` 
ADD CONSTRAINT `enroll_student`
  FOREIGN KEY (`St_Id`)
  REFERENCES `registrardb`.`student` (`St_Id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `registrardb`.`grade` 
ADD CONSTRAINT `grade_student`
  FOREIGN KEY (`St_Id`)
  REFERENCES `registrardb`.`student` (`St_Id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `grade_section`
  FOREIGN KEY (`S_Id`)
  REFERENCES `registrardb`.`section` (`S_Id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `registrardb`.`section` 
ADD CONSTRAINT `section_course`
  FOREIGN KEY (`C_Id`)
  REFERENCES `registrardb`.`course` (`C_Id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `section_professor`
  FOREIGN KEY (`P_Name`)
  REFERENCES `registrardb`.`professor` (`P_Name`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `registrardb`.`teach` 
ADD CONSTRAINT `teac_course`
  FOREIGN KEY (`C_Id`)
  REFERENCES `registrardb`.`course` (`C_Id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `registrardb`.`teach_pool` 
ADD CONSTRAINT `teach_pool_course`
  FOREIGN KEY (`C_Id`)
  REFERENCES `registrardb`.`course` (`C_Id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `teach_pool_pofessor`
  FOREIGN KEY (`P_Name`)
  REFERENCES `registrardb`.`professor` (`P_Name`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
