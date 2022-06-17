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
trigger RestrictContactByName on Contact (before insert, before update) {
	
	//check contacts prior to insert or update for invalid data
	For (Contact c : Trigger.New) {
		if(c.LastName == 'INVALIDNAME') {	//invalidname is invalid
			c.AddError('The Last Name "'+c.LastName+'" is not allowed for DML');
		}

	}



}