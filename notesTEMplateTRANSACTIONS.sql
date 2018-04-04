--Begin transaction
--DML1
--if @@error<>0
--		rollback
--	else
--		DML2
--		if @@error<>0
--		rollback
--	else
--		DML3
--		if @@error<>0
--		rollback

--		else
--		comit transaction

