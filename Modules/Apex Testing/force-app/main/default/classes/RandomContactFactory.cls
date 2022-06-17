/**
 * @description       : 
 * @author            : Liam Jeong: dev.liam.jeong@gmail.com
 * @group             : 
 * @last modified on  : 2022-06-17
 * @last modified by  : Liam Jeong: dev.liam.jeong@gmail.com
 * Modifications Log
 * Ver   Date         Author                                 Modification
 * 1.0   2022-06-17   Liam Jeong: dev.liam.jeong@gmail.com   Initial Version
**/
public with sharing class RandomContactFactory {
    
    static final String ALL_CHARS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz';
    static final Integer LEN_OF_RND_STRING = 5;

    public static List<Contact> generateRandomContacts(Integer numOfCons, String lName) {
        
        String randStr = '';
        List<Contact> cons = new List<Contact>();

        for (Integer i = 0; i < numOfCons; i++) {
            
            while (randStr.length() < LEN_OF_RND_STRING) {

                Integer rndIdx = Math.mod(Math.abs(Crypto.getRandomInteger()), ALL_CHARS.length());
                randStr += ALL_CHARS.substring(rndIdx, rndIdx+1);

            }

            cons.add(new Contact(LastName=lName, FirstName=randStr));

            randStr = '';
        }

        return cons;

    }

}
