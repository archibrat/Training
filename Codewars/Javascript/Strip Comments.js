function solution(input, markers) {
  let markerFound = false;
  let stripped = [];
  let letters = input.split('');
  for (let i = 0; i < letters.length; i++) {
    if (markers.includes(letters[i])) {
      markerFound = true;
    }

    if (markerFound && letters[i] === "\n") {
      markerFound = false;
    }

    if (!markerFound) {
      stripped.push(letters[i]);
    }

  }
  return stripped.join('').replace(/\s\n/,'\n').trim();
}

console.log(solution("apples, pears # and bananas\ngrapes\nbananas !apples", ["#", "!"]));
