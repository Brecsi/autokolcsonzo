// create table data

let tbody = document.getElementById("tbody");




//fetch 
fetch("http://localhost:3000/user")
    .then(res => res.json())
    .then(json => {
        json.map(data => {
            console.log(data.userName)
            tbody.append(td_func(data));
        })
    })


function td_func({img, userName, email, status, number}){
    let td = document.createElement('tr');
    td.innerHTML = `
    <tr>
    <td class="px-6 py-4 whitespace-nowrap">
        <div class="flex items-center">
            <div class="flex-shrink-0 h-10 w-10">
                <img src="${img}" class="h-10 w-10 rounded-full" alt="">
            </div>
            <div class="ml-4">
                <div class="text-sm font-medium text-gray-900">
                    ${userName}
                </div>
                <div class="text-sm text-gray-500">
                    ${email}
                </div>
            </div>
        </div>
    </td>
    <td class="px-6 py-4 whitespace-nowrap">
        <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-green-100 text-green-800">
            ${status}
        </span>
    </td>
    <td class="px-6 py-4 whitespace-nowrap">
        <span class="text-sm text-grey-500">
        ${number}
        </span>
    </td>
</tr>
    `;
    return td;
}