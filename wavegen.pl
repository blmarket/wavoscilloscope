use Audio::Wav;
use Data::Dumper;

my $wav = new Audio::Wav;

my $read = $wav->read('maruta.wav');
print Dumper($read->details());

my $write = $wav->write('recording.wav', {
        'bits_sample' => 8,
        'channels' => 2,
        'sample_rate' => 44100
    });

$bit = 1;
while(@_ = $read->read()) {
    if($_[0] != 0 || $_[1] != 0) {
        @_ = ( 120 * $bit, -120 * $bit );
        $bit = -$bit;
    }
    $write->write(@_);
}

$write->finish();
