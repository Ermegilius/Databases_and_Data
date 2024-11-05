const line1 = 'firstname; lastname; age';

const parts = line1.split(';').map(item => item.trim());

console.log(parts);