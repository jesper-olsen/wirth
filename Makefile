SOURCES = p1_1.pas p3_3_knights_tour.pas p3_5_eightqueens.pas
EXECUTABLES = $(SOURCES:.pas=)

FPC = fpc
FPCFLAGS = -Oa

all: $(EXECUTABLES)

%: %.pas
	$(FPC) $(FPCFLAGS) $< -o$@

clean:
	rm -f $(EXECUTABLES) *.o *.ppu

