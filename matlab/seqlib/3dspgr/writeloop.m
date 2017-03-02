function d = writeloop
% describe 3D cartesian spgr scan loop. Use with cores.txt file which defines the cores to be played out.
% scan with toppe5.e
% $Id: writeloop.m,v 1.13 2017/01/12 14:46:39 jfnielse Exp $

% define some constants
daboff = 0;
dabon = 1;
dabadd = 2;
dabreset = 3;                 
max_pg_iamp = 2^15-2;  

% acquisition matrix
ny = 208;  
nz = 11;
nave = 1;    % number of averages ("nex")

% set flip angle and related pulse sequence amplitudes
nomflip = 90;
flip = 10;
ia_rf = 2*round(flip/nomflip*max_pg_iamp/2); 
ia_th = max_pg_iamp;

rf_spoil_seed = 117;

dabecho = 0;
phi = 0;

% loop through acquisitions
d = [];

for iim = 1:nave

	% reset spoiling
	rf_spoil_seed_cnt = 0;
	rfphase = 0;

	if iim > 1
		dabmode = dabadd;
	else
		dabmode = dabon;
	end

	for iz = 0:nz

		for iy = 1:ny

			if iz>0	
				dabslice = iz;   % rhnslices = max(dabslice)+1, must be even
				%dabview = (iim-1)*ny+iy;
				dabview = iy;  
				ia_gy = 2*round( max_pg_iamp*(((iy-1+0.5)-ny/2)/(ny/2)) /2);   % y phase-encode amplitude
				ia_gz = 2*round( max_pg_iamp*(((iz-1+0.5)-nz/2)/(nz/2)) /2);   % z phase-encode amplitude
			else
				% disdaqs
				dabslice = 1; 
				dabview = 1;
				ia_gy = 0;
				ia_gz = 0;
			end

			% transmit and receive phase (RF spoiling)
			rfphase  = rfphase + (rf_spoil_seed/180 * pi)*rf_spoil_seed_cnt;  % radians
			rf_spoil_seed_cnt = rf_spoil_seed_cnt + 1;
			rfphasetmp = atan2(sin(rfphase), cos(rfphase));      % wrap phase to (-pi,pi) range
			irfphase = 2*round(rfphasetmp/pi*max_pg_iamp/2);     % short int 

			% reset dab
			%core = 2; 
			%d = [d; core 0 0 0 0*ia_gy 0*ia_gz dabslice dabecho dabview dabreset 0 irfphase irfphase 0 0];

			textra = 0;
			f = 0;
			core = 1;  % tipdown RF pulse
			d = [d; core ia_rf ia_th 0*max_pg_iamp 0*max_pg_iamp max_pg_iamp dabslice dabecho dabview daboff phi irfphase irfphase 0 f];
			%core = 2;  % spin-echo pulse
			%f = f/2;
			%d = [d; core ia_rf ia_th max_pg_iamp 0*max_pg_iamp 0*max_pg_iamp dabslice dabecho dabview daboff phi irfphase irfphase 0 f];
			core = 2;  % readout
			d = [d; core 0 0 max_pg_iamp ia_gy ia_gz dabslice dabecho dabview dabmode phi irfphase irfphase 0 0];
			core = 3;  % gradient spoiler
			d = [d; core 0 0 0 0 max_pg_iamp dabslice dabecho dabview daboff phi irfphase irfphase textra 0]; 
		end
	end
end


% write scanloop.txt
nt = size(d,1);              % number of startseq() calls   
maxslice = max(d(:,7));
maxecho = max(d(:,8));
maxview = max(d(:,9));
fname = 'scanloop.txt';
fid = fopen(fname, 'w', 'ieee-be');
fprintf(fid, 'nt\tmaxslice\tmaxecho\tmaxview\n');
fprintf(fid, '%d\t%d\t%d\t%d\n', nt, maxslice, maxecho, maxview);
fprintf(fid, 'Core ia_rf ia_th ia_gx ia_gy ia_gz dabslice dabecho dabview dabon phi rfphase recphase \n');
fclose(fid);
fprintf(1,'\twriting scanloop.txt...');
dlmwrite(fname, d, '-append', 'delimiter', '\t'); 
fprintf(1,' done\n');

return;
