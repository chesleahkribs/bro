# @TEST-EXEC: bro -b %INPUT >out
# @TEST-EXEC: btest-diff out
# Check if @if can be used to alternative function/event definitions

@if ( 1==1 )
function test_case(msg: string)
@else
lalala
@endif
	{
	print msg;
	}

@if ( 1==1 )
event bro_init()
@else
lalala
@endif
	{
	print "1";
	test_case("2");
	}

@if ( 1==0 )
lalala
@else
event bro_init()
@endif
	{
	print "3";
	}