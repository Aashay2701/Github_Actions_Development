@IsTest
public class AccountManagerTest {

    // Test for createAccount method
    @IsTest
    static void testCreateAccount() {
        String name = 'Test Account';
        String industry = 'Technology';
        
        Id accountId = AccountManager.createAccount(name, industry);
        Account acc = [SELECT Id, Name, Industry FROM Account WHERE Id = :accountId];
        
        System.assertEquals(name, acc.Name, 'Account name should match');
        System.assertEquals(industry, acc.Industry, 'Account industry should match');
    }

    // Test for updateAccountDescription method
    @IsTest
    static void testUpdateAccountDescription() {
        Account acc = new Account(Name = 'Update Test', Industry = 'Finance');
        insert acc;

        String description = 'This is a test description.';
        AccountManager.updateAccountDescription(acc.Id, description);

        Account updatedAcc = [SELECT Description FROM Account WHERE Id = :acc.Id];
        System.assertEquals(description, updatedAcc.Description, 'Description should be updated.');
    }

    // Test for fetchAccountsByIndustry method
    @IsTest
    static void testFetchAccountsByIndustry() {
        Account acc1 = new Account(Name = 'Industry Test 1', Industry = 'Healthcare');
        Account acc2 = new Account(Name = 'Industry Test 2', Industry = 'Healthcare');
        insert new List<Account>{acc1, acc2};

        List<Account> healthcareAccounts = AccountManager.fetchAccountsByIndustry('Healthcare');
        System.assertEquals(2, healthcareAccounts.size(), 'There should be 2 accounts in Healthcare industry.');
    }

    // Test for deleteAccount method
    @IsTest
    static void testDeleteAccount() {
        Account acc = new Account(Name = 'Delete Test', Industry = 'Retail');
        insert acc;

        AccountManager.deleteAccount(acc.Id);

        List<Account> deletedAccount = [SELECT Id FROM Account WHERE Id = :acc.Id];
        System.assertEquals(0, deletedAccount.size(), 'Account should be deleted.');
    }

    // Test for exception handling in createAccount
    @IsTest
    static void testCreateAccountException() {
        Test.startTest();
        try {
            AccountManager.createAccount('', 'Technology');
            System.assert(false, 'Expected CustomException was not thrown.');
        } catch (AccountManager.CustomException e) {
            System.assertEquals('Name and Industry are required fields.', e.getMessage());
        }
        Test.stopTest();
    }
}