//this is all happening in the backend 
/* 
we want 3 methods:
    create a user
    login a user
    sign a user out


name each method according to the HTTP method that it will be using
*/

//CREATE USER
export const postUser = user => (
    $.ajax({
        method: 'POST',
        url: `/api/users`,
        data: { user }
    })
);

//LOGIN USER
export const postSession = user => (
    $.ajax({
        method: 'POST',
        url: `/api/session`,
        data: { user }
    })
);

//SIGN OUT USER (deletes session & logs out user)
export const deleteSession = () => (
    $.ajax({
        method: 'DELETE',
        url: `/api/session`
    })
)