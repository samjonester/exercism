var DnaTranscriber = function() {};
module.exports = DnaTranscriber;

var conversions = {
  'C': 'G',
  'G': 'C',
  'A': 'U',
  'T': 'A'
};

var transcribe = function(d) {
  return conversions[d];
};

DnaTranscriber.prototype.toRna = function(dna) {
  return dna.split('').map(transcribe).join('');
};
