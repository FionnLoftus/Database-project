-- SQL Queries
-- Student G00329882
-- Name Fionn Loftus

-- Query 1 "Select" 

-- This query selects the  first and second name, guest_ID, number of guests, their email, the bill ID 
-- and whether or not the have paid their bill for all those whose reservation occurred between the dates 2016-01-01" and "2016-2-31".

select guest.F_Name, guest.L_Name, guest.Guest_ID, reservation.Guest_num, room.Room_ID, guest.Email, billing.Bill_ID, billing.Paid
from reservation, room, guest, billing
where reservation.Guest_ID=Guest.Guest_ID and Reservation.Room_ID=Room.Room_ID and reservation.Bill_ID=billing.Bill_ID 
and Check_in BETWEEN "2016-01-01" AND "2016-2-31";




-- Query 2 "insert" 

-- In this query a new guest is entered into the database. The data is first entered into the guest table to create a primary key for the reservation table. 
-- If done with reservation first there would be no guest_ID primary key with which to build the reservation.

insert into guest (Guest_ID, F_Name, L_Name, Email, Contact_No, Address, DOB)
Values (107, "Patrick", "Murphy", "PM@hotmail.com", "0857768246","Sligo", "2016-7-9")

INSERT into reservation (Res_ID, Guest_ID, Room_ID, Check_in, Check_out, Guest_num)
values (1007, 107, 14, "2016-01-20", "2016-01-25",2)





-- Query 3 "Update" 


-- A mistake has been made and the name of the guest must be corrected, an update query is used to change the name of the guest.  
-- The changes are targeted in guest as that is were the name details are held it is targeted using the primary key of "guest_ID=107"

update guest 
set F_Name="Liam", L_Name="Kelly"
where Guest_ID= 107; 




-- Query 4 "Delete" 

-- The Guest has decided to cancel the reservation completely. The delete is carried out by targeting the guest_ID in reservation but the guest details in "GUEST" will remain for future visits.

delete from reservation
where guest_ID= 107;



