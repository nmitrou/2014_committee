sig1h = hilbert(sig1);
phu1 = unwrap(angle(sig1h));

sig2h = hilbert(p1);
phu2 = unwrap(angle(sig2h));

impre = imRS(8:27,:,:);

imresh = reshape(impre,[740 1601]);

p1h = hilbert(p1);
p1p = unwrap(angle(p1h))';


%% 
rhilb = zeros(740,1601);
phu = zeros(740,1601);
pcs = zeros(740,740);
len = (1:1601)';

for j = 1:740
    rhilb(j,:) = hilbert(imresh(j,:));
end

for l = 1:740
    phu(l,:) = unwrap(angle(rhilb(l,:)));
end

phu = phu';

for k = 1:740
   pcs(k,:) = abs(1/len.*sum(exp(1i.*(p1p-(squeeze(phu(:,k)))))));
end


%% 
pc=abs(1/len.*sum(exp(1i.*(p1p-sig1p))))