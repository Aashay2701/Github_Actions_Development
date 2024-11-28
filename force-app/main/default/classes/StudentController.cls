public with sharing class StudentController {
    // this change is not present in org
    @AuraEnabled
    public static Id createStudentRecord(Map<String, Object> studentData) {
        Student__c newStudent = new Student__c(
            Name__c = (String) studentData.get('Name__c'),
            Email__c = (String) studentData.get('Email__c'),
            Course__c = (String) studentData.get('Course__c')
        );

        try {
            insert newStudent;
            return newStudent.Id;
        } catch (Exception e) {
            System.debug('Error creating student record: ' + e.getMessage());
            return null;
        }
    }
    
    @AuraEnabled
    public static Id createSurveyRecord(Map<String, Object> surveyData) {
        Survey__c newSurvey = new Survey__c(
            //Student__c = (String) surveyData.get('Student__c'),
            Subject__c = (String) surveyData.get('Subject__c'),
            Course__c = (String) surveyData.get('Course__c'),
            Email__c = (String) surveyData.get('Email__c'),
            Name__c = (String) surveyData.get('Name__c'),
            Q1__c = (String) surveyData.get('Q1__c'),
            Q2__c = (String) surveyData.get('Q2__c'),
            Q3__c = (String) surveyData.get('Q3__c'),
            Q4__c = (String) surveyData.get('Q4__c'),
            Q5__c = (String) surveyData.get('Q5__c'),
            Q6__c = (String) surveyData.get('Q6__c'),
            C1__c = (String) surveyData.get('C1__c'),
            C2__c = (String) surveyData.get('C2__c'),
            C3__c = (String) surveyData.get('C3__c'),
            C4__c = (String) surveyData.get('C4__c'),
            C5__c = (String) surveyData.get('C5__c'),
            C6__c = (String) surveyData.get('C6__c')
        );

        try {
            insert newSurvey;
            return newSurvey.Id;
        } catch (Exception e) {
            System.debug('Error creating survey record: ' + e.getMessage());
            return null;
        }
    }
    
    @AuraEnabled
    public static Id createRatingRecord(Map<String, Object> ratingData) {
        Survey_Rating__c newRating = new Survey_Rating__c(
            Name = (String) ratingData.get('Name'),
            Rating__c  = (String) ratingData.get('Rating__c')
        );

        try {
            insert newRating;
            return newRating.Id;
        } catch (Exception e) {
            System.debug('Error creating student record: ' + e.getMessage());
            return null;
        }
    }
}