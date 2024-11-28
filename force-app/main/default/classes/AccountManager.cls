public class AccountManager {

    // Method to create a new account
    public static Id createAccount(String name, String industry) {
        if (String.isBlank(name) || String.isBlank(industry)) {
            throw new CustomException('Name and Industry are required fields.');
        }
        Account newAccount = new Account(Name = name, Industry = industry);
        insert newAccount;
        return newAccount.Id;
    }

    // Method to update the description of an account
    public static void updateAccountDescription(Id accountId, String description) {
        if (String.isBlank(description)) {
            throw new CustomException('Description cannot be empty.');
        }
        Account acc = [SELECT Id, Description FROM Account WHERE Id = :accountId LIMIT 1];
        acc.Description = description;
        update acc;
    }

    // Method to fetch accounts by industry
    public static List<Account> fetchAccountsByIndustry(String industry) {
        if (String.isBlank(industry)) {
            throw new CustomException('Industry is required to fetch accounts.');
        }
        return [SELECT Id, Name, Industry FROM Account WHERE Industry = :industry];
    }

    // Method to delete an account
    public static void deleteAccount(Id accountId) {
        Account acc = [SELECT Id FROM Account WHERE Id = :accountId LIMIT 1];
        delete acc;
    }

    // Custom exception class for better error handling
    public class CustomException extends Exception {}
}