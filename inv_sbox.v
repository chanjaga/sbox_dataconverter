module inv_sbox (
	input wire [7:0] U,
	output reg [7:0] S
);

always @*
begin : sbox_update

	reg U0, U1, U2, U3, U4, U5, U6, U7;
	reg S0, S1, S2, S3, S4, S5, S6, S7;
	reg Y5;
	reg T1, T2, T3, T4, T6, T8, T9, T10, T13, T14, T15, T16, T17, T19;
	reg T20, T22, T23, T24, T25, T26, T27;
	reg M1, M2, M3, M4, M5, M6, M7, M8, M9, M10, M11, M12, M13, M14;
	reg M15, M16, M17, M18, M19, M20, M21, M22, M23, M24, M25, M26, M27;
	reg M28, M29, M30, M31, M32, M33, M34, M35, M36, M37, M38, M39, M40;
	reg M41, M42, M43, M44, M45, M46, M47, M48, M49, M50, M51, M52, M53;
	reg M54, M55, M56, M57, M58, M59, M60, M61, M62, M63;
	
	{ U0, U1, U2, U3, U4, U5, U6, U7 } = U;
	
	begin : decrypt_top
		reg R5, R13, R17, R18, R19;
		
		T23 = U0 ^ U3;
		T22 = ~(U1 ^ U3);
		T2 = ~(U0 ^ U1); 
		T1 = U3 ^ U4; 
		T24 = ~(U4 ^ U7);
		R5 = U6 ^ U7; 
		T8 = ~(U1 ^ T23);
		T19 = T22 ^ R5;
		T9 = ~(U7 ^ T1);
		T10 = T2 ^ T24;
		T13 = T2 ^ R5;
		T3 = T1 ^ R5;
		T25 = ~(U2 ^ T1);
		R13 = U1 ^ U6;
		T17 = ~(U2 ^ T19);
		T20 = T24 ^ R13;
		T4 = U4 ^ T8;
		R17 = ~(U2 ^ U5);
		R18 = ~(U5 ^ U6);
		R19 = ~(U2 ^ U4);
		Y5 = U0 ^ R17;
		T6 = T22 ^ R17;
		T16 = R13 ^ R19;
		T27 = T1 ^ R18;
		T15 = T10 ^ T27;
		T14 = T10 ^ R18;
		T26 = T3 ^ T16;
	end

	M1 = T13 & T6; /* M1 = T13 x T6 */
	M2 = T23 & T8; /* M2 = T23 x T8 */
	M3 = T14 ^ M1; /* M3 = T14 + M1 */
	M4 = T19 & Y5; /* M4 = T19 x Y5 */
	M5 = M4 ^ M1; /* M5 = M4 + M1 */
	M6 = T3 & T16; /* M6 = T3 x T16 */
	M7 = T22 & T9; /* M7 = T22 x T9 */
	M8 = T26 ^ M6; /* M8 = T26 + M6 */
	M9 = T20 & T17; /* M9 = T20 x T17 */
	M10 = M9 ^ M6; /* M10 = M9 + M6 */
	M11 = T1 & T15; /* M11 = T1 x T15 */
	M12 = T4 & T27; /* M12 = T4 x T27 */
	M13 = M12 ^ M11; /* M13 = M12 + M11 */
	M14 = T2 & T10; /* M14 = T2 x T10 */
	M15 = M14 ^ M11; /* M15 = M14 + M11 */
	M16 = M3 ^ M2; /* M16 = M3 + M2 */
	M17 = M5 ^ T24; /* M17 = M5 + T24 */
	M18 = M8 ^ M7; /* M18 = M8 + M7 */
	M19 = M10 ^ M15; /* M19 = M10 + M15 */
	M20 = M16 ^ M13; /* M20 = M16 + M13 */
	M21 = M17 ^ M15; /* M21 = M17 + M15 */
	M22 = M18 ^ M13; /* M22 = M18 + M13 */
	M23 = M19 ^ T25; /* M23 = M19 + T25 */
	M24 = M22 ^ M23; /* M24 = M22 + M23 */
	M25 = M22 & M20; /* M25 = M22 x M20 */
	M26 = M21 ^ M25; /* M26 = M21 + M25 */
	M27 = M20 ^ M21; /* M27 = M20 + M21 */
	M28 = M23 ^ M25; /* M28 = M23 + M25 */
	M29 = M28 & M27; /* M29 = M28 x M27 */
	M30 = M26 & M24; /* M30 = M26 x M24 */
	M31 = M20 & M23; /* M31 = M20 x M23 */
	M32 = M27 & M31; /* M32 = M27 x M31 */
	M33 = M27 ^ M25; /* M33 = M27 + M25 */
	M34 = M21 & M22; /* M34 = M21 x M22 */
	M35 = M24 & M34; /* M35 = M24 x M34 */
	M36 = M24 ^ M25; /* M36 = M24 + M25 */
	M37 = M21 ^ M29; /* M37 = M21 + M29 */
	M38 = M32 ^ M33; /* M38 = M32 + M33 */
	M39 = M23 ^ M30; /* M39 = M23 + M30 */
	M40 = M35 ^ M36; /* M40 = M35 + M36 */
	M41 = M38 ^ M40; /* M41 = M38 + M40 */
	M42 = M37 ^ M39; /* M42 = M37 + M39 */
	M43 = M37 ^ M38; /* M43 = M37 + M38 */
	M44 = M39 ^ M40; /* M44 = M39 + M40 */
	M45 = M42 ^ M41; /* M45 = M42 + M41 */
	M46 = M44 & T6; /* M46 = M44 x T6 */
	M47 = M40 & T8; /* M47 = M40 x T8 */
	M48 = M39 & Y5; /* M48 = M39 x Y5 */
	M49 = M43 & T16; /* M49 = M43 x T16 */
	M50 = M38 & T9; /* M50 = M38 x T9 */
	M51 = M37 & T17; /* M51 = M37 x T17 */
	M52 = M42 & T15; /* M52 = M42 x T15 */
	M53 = M45 & T27; /* M53 = M45 x T27 */
	M54 = M41 & T10; /* M54 = M41 x T10 */
	M55 = M44 & T13; /* M55 = M44 x T13 */
	M56 = M40 & T23; /* M56 = M40 x T23 */
	M57 = M39 & T19; /* M57 = M39 x T19 */
	M58 = M43 & T3; /* M58 = M43 x T3 */
	M59 = M38 & T22; /* M59 = M38 x T22 */
	M60 = M37 & T20; /* M60 = M37 x T20 */
	M61 = M42 & T1; /* M61 = M42 x T1 */
	M62 = M45 & T4; /* M62 = M45 x T4 */
	M63 = M41 & T2; /* M63 = M41 x T2 */

	begin : decrypt_bot
		reg P0, P1, P2, P3, P4, P5, P6, P7, P8, P9, P10, P11, P12, P13, P14;
		reg P15, P16, P17, P18, P19, P20, P22, P23, P24, P25, P26, P27;
		reg P28, P29;
		
		P0 = M52 ^ M61;
		P1 = M58 ^ M59;
		P2 = M54 ^ M62;
		P3 = M47 ^ M50;
		P4 = M48 ^ M56;
		P5 = M46 ^ M51;
		P6 = M49 ^ M60;
		P7 = P0 ^ P1;
		P8 = M50 ^ M53;
		P9 = M55 ^ M63;
		P10 = M57 ^ P4;
		P11 = P0 ^ P3;
		P12 = M46 ^ M48;
		P13 = M49 ^ M51;
		P14 = M49 ^ M62;
		P15 = M54 ^ M59;
		P16 = M57 ^ M61;
		P17 = M58 ^ P2;
		P18 = M63 ^ P5;
		P19 = P2 ^ P3;
		P20 = P4 ^ P6;
		P22 = P2 ^ P7;
		P23 = P7 ^ P8;
		P24 = P5 ^ P7;
		P25 = P6 ^ P10;
		P26 = P9 ^ P11;
		P27 = P10 ^ P18;
		P28 = P11 ^ P25;
		P29 = P15 ^ P20;

		S0 = P13 ^ P22;
		S1 = P26 ^ P29;
		S2 = P17 ^ P28;
		S3 = P12 ^ P22;
		S4 = P23 ^ P27;
		S5 = P19 ^ P24;
		S6 = P14 ^ P23;
		S7 = P9 ^ P16;
	end

S = { S0, S1, S2, S3, S4, S5, S6, S7 };
end

endmodule