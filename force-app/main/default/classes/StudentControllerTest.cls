@IsTest
public class StudentControllerTest {
    
    

   



    // Test for exception handling in createStudentRecord
    @IsTest
    static void testCreateStudentRecordException() {
        Test.startTest();
        try {
            // Pass incomplete data to trigger exception
            Map<String, Object> invalidStudentData = new Map<String, Object>{ 'Email__c' => 'invalid@example.com' };
            Id studentId = StudentController.createStudentRecord(invalidStudentData);
            System.assertEquals(null, studentId, 'Expected null due to exception.');
        } catch (Exception e) {
            System.assert(false, 'Exception should not propagate.');
        }
        Test.stopTest();
    }

    // Test for exception handling in createSurveyRecord
    @IsTest
    static void testCreateSurveyRecordException() {
        Test.startTest();
        try {
            // Pass incomplete data to trigger exception
            Map<String, Object> invalidSurveyData = new Map<String, Object>{ 'Subject__c' => 'Invalid Survey' };
            Id surveyId = StudentController.createSurveyRecord(invalidSurveyData);
            System.assertEquals(null, surveyId, 'Expected null due to exception.');
        } catch (Exception e) {
            System.assert(false, 'Exception should not propagate.');
        }
        Test.stopTest();
    }

    
}