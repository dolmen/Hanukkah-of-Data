SELECT name, phone
FROM customers
WHERE name REGEXP
	REPLACE(
		REPLACE(
			REPLACE(
				REPLACE(
					REPLACE(
						REPLACE(
							REPLACE(
								REPLACE(
									REPLACE(
										REPLACE(
											REPLACE(phone, '-', ''),
											'2', '[ABCabc]'),
										'3', '[DEFdef]'),
									'4', '[GHIghi]'),
								'5', '[JKLjkl]'),
							'6', '[MNOmno]'),
						'7', '[PQRSpqrs]'),
					'8', '[TUVtuv]'),
				'9', '[WXYZwxyz]'),
			'0', '.'),
		'1', '.')
;
